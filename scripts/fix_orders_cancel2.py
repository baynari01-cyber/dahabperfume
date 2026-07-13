import re

with open("src/actions/orders.ts", "r") as f:
    content = f.read()

pattern = r"// Check if there is an active Formula.*?(?=\s*// Log final product inventory movement)"

replacement = """
"""

content = re.sub(pattern, replacement, content, flags=re.DOTALL)

with open("src/actions/orders.ts", "w") as f:
    f.write(content)

