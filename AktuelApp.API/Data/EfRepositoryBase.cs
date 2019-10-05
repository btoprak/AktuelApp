using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using AktuelApp.API.Models;
using Microsoft.EntityFrameworkCore;

namespace AktuelApp.API.Data
{
    public class EfRepositoryBase:IEntityRepository
    {
        private readonly AktuelListContext _context;
        public EfRepositoryBase(AktuelListContext context)
        {
            _context=context;
        }

        public void Add<T>(T entity) where T : class
        {
            _context.Add(entity);
        }

        public void Delete<T>(T entity) where T : class
        {
            _context.Remove(entity);
        }

        public Aktuel GetAktuel(Expression<Func<Aktuel, bool>> filter = null)
        {
            return _context.Set<Aktuel>().SingleOrDefault(filter);
        }
        
        

        public AktuelDetail GetAktuelDetail(Expression<Func<AktuelDetail, bool>> filter = null)
        {
            return _context.Set<AktuelDetail>().SingleOrDefault(filter);
        }

        public List<AktuelDetail> GetAktuelDetails(Expression<Func<AktuelDetail, bool>> filter = null)
        {
            return filter == null ? _context.Set<AktuelDetail>().ToList() : _context.Set<AktuelDetail>().Where(filter).ToList();
        }

        public List<Aktuel> GetAktuels(Expression<Func<Aktuel, bool>> filter = null)
        {
            return filter == null ? _context.Set<Aktuel>().ToList() : _context.Set<Aktuel>().Where(filter).ToList();
        }

        public List<Company> GetCompanies(Expression<Func<Company, bool>> filter = null)
        {
            return filter == null ? _context.Set<Company>().ToList() : _context.Set<Company>().Where(filter).ToList();
        }

        public Company GetCompany(Expression<Func<Company, bool>> filter = null)
        {
            return _context.Set<Company>().SingleOrDefault(filter);
        }

        public void Update<T>(T entity) where T : class
        {
            _context.Update(entity);
        }

        // public TEntity Get(Expression<Func<TEntity, bool>> filter)
        // {
        //     using(var context=new TContext())
        //     {
        //         return context.Set<TEntity>().SingleOrDefault(filter);
        //     }
        // }

        // public List<TEntity> GetList(Expression<Func<TEntity, bool>> filter = null)
        // {
        //     using(var context=new TContext())
        //     {
        //         return filter == null ? context.Set<TEntity>().ToList() : context.Set<TEntity>().Where(filter).ToList();
        //     }
        // }

        // public void Add(TEntity entity)
        // {
        //     using(var context=new TContext())
        //     {
        //         var addedEntity = context.Entry(entity);
        //         addedEntity.State = EntityState.Added;
        //         context.SaveChanges();
        //     }
        // }

        // public void Update(TEntity entity)
        // {
        //     using (var context = new TContext())
        //     {
        //         var updatedEntity = context.Entry(entity);
        //         updatedEntity.State = EntityState.Modified;
        //         context.SaveChanges();
        //     }
        // }

        // public void Delete(TEntity entity)
        // {
        //     using (var context = new TContext())
        //     {
        //         var deletedEntity = context.Entry(entity);
        //         deletedEntity.State = EntityState.Deleted;
        //         context.SaveChanges();
        //     }
        // }
    }
}