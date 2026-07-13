import re

with open("prisma/schema.prisma", "r") as f:
    content = f.read()

# Remove remaining relations
content = re.sub(r"^\s*assignedCounts\s+InventoryCountSession\[\].*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*createdCounts\s+InventoryCountSession\[\].*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*reviewedCounts\s+InventoryCountSession\[\].*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*approvedCounts\s+InventoryCountSession\[\].*\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*verifiedStocks\s+ProductLiquidStock\[\].*\n", "", content, flags=re.MULTILINE)

with open("prisma/schema.prisma", "w") as f:
    f.write(content)
