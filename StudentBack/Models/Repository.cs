using StudentBack;
using StudentBack.Models;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;

namespace StudenBack.Models
{
    public class Repository<T> : IRepository<T> where T : class
    {
        private StudentEntities db = null;
        private DbSet<T> dbset = null;

        public Repository()
        {
            db = new StudentEntities();
            dbset = db.Set<T>();
        }
        public void Create(T _entity)
        {
            dbset.Add(_entity);
            db.SaveChanges();
        }

        public void Delete(T _entity)
        {
            dbset.Remove(_entity);
            db.SaveChanges();
        }

        public IEnumerable<T> GetAll()
        {
            return dbset;
        }

        public T GetByID(int id)
        {
            return dbset.Find(id);
        }

        public void Update(T _entity)
        {
            db.Entry(_entity).State = EntityState.Modified;
            db.SaveChanges();
        }

        //驗證登入者帳號密碼
        public employee CheckAccPwd(string acc, string pwd)
        {
            var loginEmp = db.employee.FirstOrDefault(e => e.employeeAccount == acc);
            if (loginEmp == null) return null;
            console.write("loginEmp!=null");


            //varifypassword
            bool pwdcorrect = ee.ValidatePassword(pwd, loginEmp.employeeSalt, loginEmp.employeePwd);
            if (!pwdcorrect) return null;
            console.write("loginEmp.pwd ok");


            return loginEmp;
        }
    }
}