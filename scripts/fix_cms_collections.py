import re

with open("src/components/CMSHomepageForm.tsx", "r") as f:
    content = f.read()

# 1. Remove `<option value="COLLECTION">مجموعة</option>`
content = re.sub(r'<option value="COLLECTION">مجموعة</option>\s*', '', content)

# 2. Rename `<option value="CATEGORY">تصنيف</option>` to `التصنيفات / المجموعات`
content = content.replace('<option value="CATEGORY">تصنيف</option>', '<option value="CATEGORY">تصنيف / مجموعة</option>')

# 3. Remove `editingSlide.destinationType === 'COLLECTION'` block completely
pattern1 = r"\{editingSlide\.destinationType === 'COLLECTION' && \(.*?\)\}"
content = re.sub(pattern1, '', content, flags=re.DOTALL)

# 4. Remove `newSlide.destinationType === 'COLLECTION'` block completely
pattern2 = r"\{newSlide\.destinationType === 'COLLECTION' && \(.*?\)\}"
content = re.sub(pattern2, '', content, flags=re.DOTALL)

with open("src/components/CMSHomepageForm.tsx", "w") as f:
    f.write(content)

