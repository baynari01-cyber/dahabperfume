import re

with open("src/components/CMSHomepageForm.tsx", "r") as f:
    content = f.read()

# remove collectionId field
content = re.sub(r"^\s*collectionId: '',\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*collectionId:\s*newSlide\.collectionId\s*\|\|\s*null,\n", "", content, flags=re.MULTILINE)
content = re.sub(r"^\s*collectionId:\s*editingSlide\.collectionId\s*\|\|\s*null,\n", "", content, flags=re.MULTILINE)

# remove UI blocks referencing collections
collection_block = r"""\s*\{editingSlide\.destinationType === 'COLLECTION' && \(\s*<div className="md:col-span-2">\s*<label className="block text-sm font-bold text-zinc-700 mb-1">اختر المجموعة</label>\s*<select\s*className="w-full p-2 border border-zinc-300 rounded focus:border-\[var\(--color-champagne-600\)\]"\s*value=\{editingSlide\.collectionId \|\| ''\}\s*onChange=\{\(e\) => setEditingSlide\(\{ \.\.\.editingSlide, collectionId: e\.target\.value \}\)\}\s*>\s*<option value="">-- اختر مجموعة --</option>\s*\{collections\.map\(c => \(\s*<option key=\{c\.id\} value=\{c\.id\}>\{c\.name\}</option>\s*\)\)\}\s*</select>\s*</div>\s*\)\}"""
content = re.sub(collection_block, "", content, flags=re.DOTALL)

collection_block2 = r"""\s*\{newSlide\.destinationType === 'COLLECTION' && \(\s*<div className="md:col-span-2">\s*<label className="block text-sm font-bold text-zinc-700 mb-1">اختر المجموعة</label>\s*<select\s*className="w-full p-2 border border-zinc-300 rounded focus:border-\[var\(--color-champagne-600\)\]"\s*value=\{newSlide\.collectionId\}\s*onChange=\{\(e\) => setNewSlide\(\{ \.\.\.newSlide, collectionId: e\.target\.value \}\)\}\s*>\s*<option value="">-- اختر مجموعة --</option>\s*\{collections\.map\(c => \(\s*<option key=\{c\.id\} value=\{c\.id\}>\{c\.name\}</option>\s*\)\)\}\s*</select>\s*</div>\s*\)\}"""
content = re.sub(collection_block2, "", content, flags=re.DOTALL)

# remove "COLLECTION" option from destinationType dropdowns
content = re.sub(r'<option value="COLLECTION">مجموعة تسويقية</option>', '', content)

with open("src/components/CMSHomepageForm.tsx", "w") as f:
    f.write(content)
