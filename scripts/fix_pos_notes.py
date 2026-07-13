import re

with open("src/components/POSCashierWorkspace.tsx", "r") as f:
    content = f.read()

# The notes section looks like: {selectedProduct.notes && selectedProduct.notes.length > 0 && (...)}
# Let's just find and replace the whole block manually
pattern = r"\{selectedProduct\.notes && selectedProduct\.notes\.length > 0 && \([\s\S]*?\}\s*\)\}"
content = re.sub(pattern, "", content)

with open("src/components/POSCashierWorkspace.tsx", "w") as f:
    f.write(content)

