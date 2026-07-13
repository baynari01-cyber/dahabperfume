import re

with open("prisma/schema.prisma", "r") as f:
    content = f.read()

# Delete models
models_to_delete = [
    "RawMaterialCategory",
    "RawMaterial",
    "RawMaterialStock",
    "RawMaterialMovement",
    "ProductFormula",
    "ProductFormulaItem",
    "ConsumptionRecord",
    "Collection",
    "InventoryCountSession",
    "InventoryCountLine",
    "ProductLiquidStock",
    "ProductLiquidMovement"
]

for model in models_to_delete:
    pattern = r"model " + model + r"\s*\{.*?\n\}\n"
    content = re.sub(pattern, "", content, flags=re.DOTALL)

# Remove relations from Product
content = re.sub(r"^\s*liquidStock\s+ProductLiquidStock\?.*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*liquidMovements\s+ProductLiquidMovement\[\].*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*countLines\s+InventoryCountLine\[\].*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*formulas\s+ProductFormula\[\].*\n", "", content, flags=re.MULTILINE)

# Remove Collection relation from HomepageHeroSlide
content = re.sub(r"^\s*collectionId\s+String\?.*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*collection\s+Collection\?.*\n", "", content, flags=re.MULTILINE)

# Remove inventoryMode from Product
content = re.sub(r"^\s*inventoryMode\s+String\s+@default\(\"FINISHED_PRODUCT\"\).*\n", "", content, flags=re.MULTILINE)

# Remove stock from ProductVariant
content = re.sub(r"^\s*stock\s+Int\s+@default\(0\).*\n", "", content, flags=re.MULTILINE)

# Add stockLiters to Product
product_pattern = r"(model Product\s*\{.*?)(\n\s*createdAt\s+DateTime)"
content = re.sub(product_pattern, r"\1\n  stockLiters      Float            @default(1.0)\2", content, flags=re.DOTALL)

# Change Order statuses to simple string
# add shipping cost
# wait shippingCost is already there! "shippingCost  Int"

with open("prisma/schema.prisma", "w") as f:
    f.write(content)
