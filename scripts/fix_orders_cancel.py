import re

with open("src/actions/orders.ts", "r") as f:
    content = f.read()

pattern = r"// 2\. Restore Inventory\s*const inventoryMode = variant\.product\.inventoryMode;.*?// Restore finished product stock.*?\}\n\s*\}"

replacement = """// 2. Restore Inventory
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

content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open("src/actions/orders.ts", "w") as f:
    f.write(content)
