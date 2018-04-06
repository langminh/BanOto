//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace BanOto.Entity
{
    using System;
    using System.Collections.Generic;
    
    public partial class Xe
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public Xe()
        {
            this.Anhs = new HashSet<Anh>();
            this.BinhLuans = new HashSet<BinhLuan>();
            this.CTDonHangs = new HashSet<CTDonHang>();
        }
    
        public string MaXe { get; set; }
        public string TenXe { get; set; }
        public string DungTichXiLanh { get; set; }
        public Nullable<int> MaMau { get; set; }
        public Nullable<int> LoaiHopSo { get; set; }
        public Nullable<int> MaXX { get; set; }
        public Nullable<int> MaLoaiXe { get; set; }
        public Nullable<int> MaTH { get; set; }
        public string CongXuat { get; set; }
        public Nullable<int> ChoNgoi { get; set; }
        public decimal GiaBan { get; set; }
        public Nullable<double> GiamGia { get; set; }
        public string MomenXoan { get; set; }
        public string KieuTruyenDong { get; set; }
        public Nullable<double> TrongLuong { get; set; }
        public Nullable<int> ChieuCao { get; set; }
        public Nullable<int> ChieuRong { get; set; }
        public Nullable<int> ChieuDai { get; set; }
        public Nullable<bool> TangAp { get; set; }
        public string MamVanh { get; set; }
        public string PhanhTruoc { get; set; }
        public string PhanhSau { get; set; }
        public string KichCoLopT { get; set; }
        public string KichCoLopS { get; set; }
        public string HeThongTreoTruoc { get; set; }
        public string HeThongTreoSau { get; set; }
        public Nullable<int> KhoangSangGam { get; set; }
        public string HeThongDenT { get; set; }
        public string HeThongDenS { get; set; }
        public string HeThongLoa { get; set; }
        public Nullable<bool> GuongChieuHau { get; set; }
        public Nullable<bool> ChongBoABS { get; set; }
        public string MoTa { get; set; }
        public string NoiDung { get; set; }
        public Nullable<int> DanhGia { get; set; }
        public Nullable<bool> TinhTrang { get; set; }
        public Nullable<int> SoLuong { get; set; }
        public string NamSX { get; set; }
        public string Anh { get; set; }
        public Nullable<System.DateTime> TimeCreate { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<Anh> Anhs { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<BinhLuan> BinhLuans { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<CTDonHang> CTDonHangs { get; set; }
        public virtual LoaiHopSo LoaiHopSo1 { get; set; }
        public virtual LoaiXe LoaiXe { get; set; }
        public virtual Mau Mau { get; set; }
        public virtual ThuongHieu ThuongHieu { get; set; }
        public virtual XuatXu XuatXu { get; set; }
    }
}