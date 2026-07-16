'use client';

import React, { useState, useTransition } from 'react';
import { MoreHorizontal, Edit, Trash2 } from 'lucide-react';
import { updateCategory, deleteCategory } from '@/actions/categories';

export function CategoryActionsMenu({ 
  category, 
  allCategories 
}: { 
  category: { id: string, name: string, imagePath: string | null };
  allCategories: { id: string, name: string }[];
}) {
  const [isOpen, setIsOpen] = useState(false);
  const [isEditModalOpen, setIsEditModalOpen] = useState(false);
  const [isDeleteModalOpen, setIsDeleteModalOpen] = useState(false);

  // Edit State
  const [editName, setEditName] = useState(category.name);
  const [editImage, setEditImage] = useState<File | null>(null);

  // Delete State
  const [deleteWithProducts, setDeleteWithProducts] = useState(false);
  const [fallbackCategoryId, setFallbackCategoryId] = useState('');

  const [isPending, startTransition] = useTransition();

  const handleUpdate = () => {
    if (!editName) return alert('اسم المجموعة مطلوب');

    const formData = new FormData();
    formData.append('name', editName);
    if (editImage) {
      formData.append('image', editImage);
    }

    startTransition(async () => {
      const res = await updateCategory(category.id, formData);
      if (res.success) {
        setIsEditModalOpen(false);
        setIsOpen(false);
      } else {
        alert(res.error || 'حدث خطأ أثناء التعديل');
      }
    });
  };

  const handleDelete = () => {
    if (!deleteWithProducts && !fallbackCategoryId) {
      return alert('يرجى اختيار مجموعة بديلة لنقل المنتجات إليها');
    }

    if (confirm('هل أنت متأكد من الحذف؟ لا يمكن التراجع عن هذا الإجراء.')) {
      startTransition(async () => {
        const res = await deleteCategory(category.id, deleteWithProducts, fallbackCategoryId);
        if (res.success) {
          setIsDeleteModalOpen(false);
          setIsOpen(false);
        } else {
          alert(res.error || 'حدث خطأ أثناء الحذف');
        }
      });
    }
  };

  return (
    <div className="relative">
      <button 
        onClick={() => setIsOpen(!isOpen)} 
        className="p-2 text-zinc-500 hover:bg-zinc-100 rounded-md transition-colors"
      >
        <MoreHorizontal className="w-5 h-5" />
      </button>

      {isOpen && (
        <>
          <div className="fixed inset-0 z-10" onClick={() => setIsOpen(false)} />
          <div className="absolute left-0 mt-2 w-48 bg-white border border-zinc-200 rounded-md shadow-lg z-20 py-1 text-sm font-medium">
            <button
              onClick={() => { setIsEditModalOpen(true); setIsOpen(false); }}
              className="w-full text-right px-4 py-2 hover:bg-zinc-50 text-zinc-700 flex items-center gap-2"
            >
              <Edit className="w-4 h-4" />
              تعديل المجموعة
            </button>
            <button
              onClick={() => { setIsDeleteModalOpen(true); setIsOpen(false); }}
              className="w-full text-right px-4 py-2 hover:bg-red-50 text-red-600 flex items-center gap-2"
            >
              <Trash2 className="w-4 h-4" />
              حذف المجموعة
            </button>
          </div>
        </>
      )}

      {/* Edit Modal */}
      {isEditModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
          <div className="bg-white rounded-lg p-6 max-w-md w-full shadow-xl">
            <h3 className="text-xl font-bold mb-4">تعديل المجموعة</h3>
            
            <div className="space-y-4">
              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">اسم المجموعة</label>
                <input 
                  type="text" 
                  value={editName}
                  onChange={e => setEditName(e.target.value)}
                  className="w-full border border-zinc-300 rounded-md p-2 focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                />
              </div>
              
              <div>
                <label className="block text-sm font-bold text-zinc-700 mb-1">صورة جديدة (اختياري)</label>
                <input 
                  type="file" 
                  accept="image/*"
                  onChange={e => setEditImage(e.target.files?.[0] || null)}
                  className="w-full border border-zinc-300 rounded-md p-2 text-sm"
                />
              </div>
            </div>

            <div className="mt-6 flex justify-end gap-3">
              <button 
                onClick={() => setIsEditModalOpen(false)}
                className="px-4 py-2 text-zinc-600 hover:bg-zinc-100 rounded-md transition-colors"
                disabled={isPending}
              >
                إلغاء
              </button>
              <button 
                onClick={handleUpdate}
                disabled={isPending}
                className="px-4 py-2 bg-[var(--color-charcoal-900)] text-white rounded-md hover:bg-zinc-800 transition-colors disabled:opacity-50"
              >
                {isPending ? 'جاري الحفظ...' : 'حفظ التعديلات'}
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Delete Modal */}
      {isDeleteModalOpen && (
        <div className="fixed inset-0 z-50 flex items-center justify-center bg-black/50 p-4">
          <div className="bg-white rounded-lg p-6 max-w-md w-full shadow-xl">
            <h3 className="text-xl font-bold mb-4 text-red-600">حذف المجموعة</h3>
            <p className="text-sm text-zinc-600 mb-4">
              أنت على وشك حذف مجموعة "{category.name}". ماذا تريد أن تفعل بالمنتجات التابعة لها؟
            </p>
            
            <div className="space-y-4 bg-zinc-50 p-4 rounded-md border border-zinc-200">
              <label className="flex items-start gap-2 cursor-pointer">
                <input 
                  type="radio" 
                  name="deleteOption" 
                  checked={!deleteWithProducts}
                  onChange={() => setDeleteWithProducts(false)}
                  className="mt-1 accent-[var(--color-charcoal-900)]"
                />
                <div>
                  <span className="block font-bold text-sm">الاحتفاظ بالمنتجات (موصى به)</span>
                  <span className="text-xs text-zinc-500">نقل المنتجات إلى مجموعة أخرى لتجنب مسحها من الموقع.</span>
                </div>
              </label>

              {!deleteWithProducts && (
                <div className="mr-6 mt-2">
                  <select 
                    value={fallbackCategoryId}
                    onChange={e => setFallbackCategoryId(e.target.value)}
                    className="w-full border border-zinc-300 rounded-md p-2 text-sm focus:ring-2 focus:ring-[var(--color-champagne-600)] outline-none"
                  >
                    <option value="">-- اختر مجموعة بديلة --</option>
                    {allCategories.filter(c => c.id !== category.id).map(c => (
                      <option key={c.id} value={c.id}>{c.name}</option>
                    ))}
                  </select>
                </div>
              )}

              <label className="flex items-start gap-2 cursor-pointer pt-2 border-t border-zinc-200 mt-2">
                <input 
                  type="radio" 
                  name="deleteOption" 
                  checked={deleteWithProducts}
                  onChange={() => setDeleteWithProducts(true)}
                  className="mt-1 accent-red-600"
                />
                <div>
                  <span className="block font-bold text-sm text-red-600">حذف المجموعة وجميع منتجاتها</span>
                  <span className="text-xs text-red-500/80">سيتم حذف كافة المنتجات التابعة بشكل نهائي ولا يمكن التراجع.</span>
                </div>
              </label>
            </div>

            <div className="mt-6 flex justify-end gap-3">
              <button 
                onClick={() => setIsDeleteModalOpen(false)}
                className="px-4 py-2 text-zinc-600 hover:bg-zinc-100 rounded-md transition-colors"
                disabled={isPending}
              >
                إلغاء
              </button>
              <button 
                onClick={handleDelete}
                disabled={isPending || (!deleteWithProducts && !fallbackCategoryId)}
                className="px-4 py-2 bg-red-600 text-white rounded-md hover:bg-red-700 transition-colors disabled:opacity-50"
              >
                {isPending ? 'جاري الحذف...' : 'تأكيد الحذف'}
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  );
}
