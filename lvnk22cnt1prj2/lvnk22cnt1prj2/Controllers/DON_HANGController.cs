using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using lvnk22cnt1prj2.Models;

namespace lvnk22cnt1prj2.Controllers
{
    public class DON_HANGController : Controller
    {
        private lvnk22cnt1Entities db = new lvnk22cnt1Entities();

        // GET: DON_HANG
        public ActionResult Index()
        {
            var dON_HANG = db.DON_HANG.Include(d => d.KHACH_HANG);
            return View(dON_HANG.ToList());
        }

        // GET: DON_HANG/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DON_HANG dON_HANG = db.DON_HANG.Find(id);
            if (dON_HANG == null)
            {
                return HttpNotFound();
            }
            return View(dON_HANG);
        }

        // GET: DON_HANG/Create
        public ActionResult Create()
        {
            ViewBag.CustomerID = new SelectList(db.KHACH_HANG, "CustomerID", "Ho_ten");
            return View();
        }

        // POST: DON_HANG/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "OrderID,CustomerID,Ngay_dat_hang,Tong_gia,Trang_thai")] DON_HANG dON_HANG)
        {
            if (ModelState.IsValid)
            {
                db.DON_HANG.Add(dON_HANG);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.CustomerID = new SelectList(db.KHACH_HANG, "CustomerID", "Ho_ten", dON_HANG.CustomerID);
            return View(dON_HANG);
        }

        // GET: DON_HANG/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DON_HANG dON_HANG = db.DON_HANG.Find(id);
            if (dON_HANG == null)
            {
                return HttpNotFound();
            }
            ViewBag.CustomerID = new SelectList(db.KHACH_HANG, "CustomerID", "Ho_ten", dON_HANG.CustomerID);
            return View(dON_HANG);
        }

        // POST: DON_HANG/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "OrderID,CustomerID,Ngay_dat_hang,Tong_gia,Trang_thai")] DON_HANG dON_HANG)
        {
            if (ModelState.IsValid)
            {
                db.Entry(dON_HANG).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.CustomerID = new SelectList(db.KHACH_HANG, "CustomerID", "Ho_ten", dON_HANG.CustomerID);
            return View(dON_HANG);
        }

        // GET: DON_HANG/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            DON_HANG dON_HANG = db.DON_HANG.Find(id);
            if (dON_HANG == null)
            {
                return HttpNotFound();
            }
            return View(dON_HANG);
        }

        // POST: DON_HANG/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            DON_HANG dON_HANG = db.DON_HANG.Find(id);
            db.DON_HANG.Remove(dON_HANG);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
