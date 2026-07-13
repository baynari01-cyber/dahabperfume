import re

with open("src/components/POSCashierWorkspace.tsx", "r") as f:
    content = f.read()

# 1. Remove category name
content = re.sub(r'<span className="text-\[10px\] text-zinc-400 block mb-0\.5">\{product\.category\.name\}</span>\s*', '', content)

# 2. Remove Mode from SKU line
content = re.sub(r' \| Mode: \{selectedProduct\.inventoryMode\}', '', content)

# 3. Remove Accords section completely
content = re.sub(r'<MainAccordsBars accords=\{selectedProduct\.accords\} locale="ar" />', '', content)

# 4. Remove Notes section completely
content = re.sub(r'\{selectedProduct\.notes &&.*?\}\)\}', '', content, flags=re.DOTALL)

# 5. Fix variant button disabled state
# original: disabled={!v.isActive || (selectedProduct.inventoryMode === 'FINISHED_PRODUCT' && v.stock <= 0)}
content = re.sub(
    r'disabled=\{!v\.isActive \|\| \(selectedProduct\.inventoryMode === \'FINISHED_PRODUCT\' && v\.stock <= 0\)\}',
    r'disabled={!v.isActive || selectedProduct.stockLiters <= 0}',
    content
)

# 6. Fix variant stock label display
content = re.sub(
    r'\{selectedProduct\.inventoryMode === \'FINISHED_PRODUCT\' && \(\s*<span className="text-\[9px\] text-zinc-400 mt-0\.5">مخزون: \{v\.stock\}</span>\s*\)\}',
    r'',
    content
)


with open("src/components/POSCashierWorkspace.tsx", "w") as f:
    f.write(content)

