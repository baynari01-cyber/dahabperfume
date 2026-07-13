import re

with open("src/actions/orders.ts", "r") as f:
    content = f.read()

# Fix the confirmation loop (lines 75-136)
# I will match everything from "if (formula) {" up to "// 4. Load tax settings and compute totals"
pattern_confirm = r"// Check if there is an active Formula.*?(?=\s*// 4\. Load tax settings and compute totals)"
replacement_confirm = """// 1. Inventory Deductions based on stockLiters
        const sizeStr = variant.size.toLowerCase();
        let litersToDeduct = 0;
        if (sizeStr.includes('ml')) {
           const ml = parseInt(sizeStr);
           if (!isNaN(ml)) litersToDeduct = (ml / 1000) * item.quantity;
        } else if (sizeStr.includes('l')) {
           const l = parseInt(sizeStr);
           if (!isNaN(l)) litersToDeduct = l * item.quantity;
        }

        if (litersToDeduct > 0) {
            const updatedProduct = await tx.product.updateMany({
              where: {
                id: variant.productId,
                stockLiters: { gte: litersToDeduct }
              },
              data: {
                stockLiters: { decrement: litersToDeduct }
              }
            });

            if (updatedProduct.count === 0) {
              throw new Error(`مخزون غير كافٍ للمنتج (${variant.product.nameAr})`);
            }
        }

        // Log final product inventory movement
        await tx.inventoryMovement.create({
          data: {
            sku: variant.sku,
            type: 'SALE',
            quantity: -item.quantity,
            quantityBefore: variant.product.stockLiters,
            quantityAfter: variant.product.stockLiters - litersToDeduct,
            employeeId,
            reference: `ORDER_CONFIRMATION_${order.reference}`
          }
        });
      }
"""
content = re.sub(pattern_confirm, replacement_confirm, content, flags=re.DOTALL)


# Fix the cancellation loop (lines ~380-465)
# I will match everything from "if (inventoryMode === 'DIRECT_LIQUID')" up to "// Log inventory movement"
pattern_cancel = r"if \(inventoryMode === 'DIRECT_LIQUID'\) \{.*?(?=\s*// Log inventory movement)"
replacement_cancel = """// 2. Restore Inventory
          const sizeStr = variant.size.toLowerCase();
          let litersToRestore = 0;
          if (sizeStr.includes('ml')) {
             const ml = parseInt(sizeStr);
             if (!isNaN(ml)) litersToRestore = (ml / 1000) * item.quantity;
          } else if (sizeStr.includes('l')) {
             const l = parseInt(sizeStr);
             if (!isNaN(l)) litersToRestore = l * item.quantity;
          }

          if (litersToRestore > 0) {
              await tx.product.update({
                where: { id: variant.productId },
                data: { stockLiters: { increment: litersToRestore } }
              });
          }
"""
content = re.sub(pattern_cancel, replacement_cancel, content, flags=re.DOTALL)


with open("src/actions/orders.ts", "w") as f:
    f.write(content)
