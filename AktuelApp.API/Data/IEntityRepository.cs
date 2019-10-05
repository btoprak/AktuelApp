using System;
using System.Collections.Generic;
using System.Linq.Expressions;
using AktuelApp.API.Models;

namespace AktuelApp.API.Data
{
    public interface IEntityRepository
    {
        //T Get(Expression<Func<T, bool>> filter = null);
        //List<T> GetList(Expression<Func<T, bool>> filter = null);

        //void Add(T entity);
        //void Update(T entity);
        //void Delete(T entity);
        List<Company> GetCompanies(Expression<Func<Company, bool>> filter = null);
        Company GetCompany(Expression<Func<Company, bool>> filter = null);

        List<Aktuel> GetAktuels(Expression<Func<Aktuel, bool>> filter = null);
        Aktuel GetAktuel(Expression<Func<Aktuel, bool>> filter = null);

        List<AktuelDetail> GetAktuelDetails(Expression<Func<AktuelDetail, bool>> filter = null);
        AktuelDetail GetAktuelDetail(Expression<Func<AktuelDetail, bool>> filter = null);
        void Add<T>(T entity) where T:class;
        void Update<T>(T entity) where T:class;
        void Delete<T>(T entity) where T:class;
    }
}