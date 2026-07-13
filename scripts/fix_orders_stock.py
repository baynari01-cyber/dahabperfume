import re

with open("src/actions/orders.ts", "r") as f:
    content = f.read()

pattern = r"// 1\. Inventory Deductions based on mode\s*const inventoryMode = variant\.product\.inventoryMode;.*?// Create standard Finished Product inventory movement.*?\}\n\s*\}"

replacement = """// 1. Inventory Deductions based on stockLiters
        const sizeStr = variant.size.toLowerCase();
        let litersToDeduct = 0;
        if (sizeStr.includes('ml')) {
           const ml = parseInt(sizeStr);
           if (!isNaN(ml)) litersToDeduct = (ml / 1000) * quantity;
        } else if (sizeStr.includes('l')) {
           const l = parseInt(sizeStr);
           if (!isNaN(l)) litersToDeduct = l * quantity;
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
        }"""

content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open("src/actions/orders.ts", "w") as f:
    f.write(content)
