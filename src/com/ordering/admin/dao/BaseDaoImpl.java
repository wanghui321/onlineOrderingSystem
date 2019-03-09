package com.ordering.admin.dao;

import java.io.Serializable;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.hql.internal.ast.QueryTranslatorImpl;
import org.hibernate.internal.SessionFactoryImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
@Repository
@SuppressWarnings({ "unchecked", "hiding" })
public class BaseDaoImpl<T> implements BaseDao<T> {
	@Autowired
	private SessionFactory sessionFactory;

	public Session getSession() {
		try{
			return sessionFactory.getCurrentSession();
		}catch(Exception e){
			System.out.println("Open new Session with sessionFactory.openSession() method, Remenber to close it!");
			return sessionFactory.openSession();
		}
	}

	public void delete(T entity) {
		this.getSession().delete(entity);
	}

	public void deleteById(Class<T> entityClass,Serializable id) {
		this.getSession().delete(this.findById(entityClass,id));
	}

	public void save(T entity) {
		this.getSession().save(entity);

	}
	
	public void saveLog(T entity){
		Session session = this.getSession();
		session.save(entity);
		session.close();
	}

	public void saveorupdate(T entity) {
		this.getSession().saveOrUpdate(entity);

	}

	public void update(String hql, List<Object> params) {
		Query query = this.getSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			query.setParameter(i, params.get(i));
		}
		query.executeUpdate();
	}

	public List<T> findSql(String sql,Class<T> entityClass) {
		Query query = this.getSession().createSQLQuery(sql).addEntity(entityClass);
		return query.list();
	}
	
	public List<T> findHqlByPage(String hql, List<Object> params, int page, int rows) {
		Query query = this.getSession().createQuery(hql);
		for (int i = 0; i < params.size(); i++) {
			query.setParameter(i, params.get(i));
		}
		return query.setMaxResults(rows)
                .setFirstResult(page).list();
	}
	/**
	 * 将HQL转为sql
	 * @param hql
	 * @return
	 */
	public  String transHqlToSql(String hql) {
        // 当hql为null或空时,直接返回null
        if (hql == null || hql.equals("")) {
            return "";
        }
        // 得到Query转换器实现类
        QueryTranslatorImpl queryTranslator = new QueryTranslatorImpl(hql, hql, Collections.EMPTY_MAP, (SessionFactoryImpl)sessionFactory);
        queryTranslator.compile(Collections.EMPTY_MAP, false);
        // 得到sql
        String sql = queryTranslator.getSQLString();
        return sql;
    }
	/**
	 * 将sql的?替换为参数
	 * @param hql
	 * @return
	 */
	public  String transHqlToSql(String hql, List<Object> params) {
        // 要返回的sql语句
        String sql = transHqlToSql(hql);
        // 当为null或空时,返回null
        if (sql == null || sql.equals("")) {
            return null;
        }
        // 赋参数值
        if (params != null && params.size() > 0) {
            for (int i = 0; i < params.size(); i++) {
                sql = sql.replaceFirst("\\?", "\\'" + params.get(i).toString() + "\\'");
            }
        }
        return sql;
    }
	
	
	public List<T> findByHql(String hql, List<Object> params) {
		Query query = this.getSession().createQuery(hql);
		if (null != params && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				if(params.get(i) instanceof List){
					query.setParameterList("list", (List<Object>) params.get(i));
				}else{
					query.setParameter(i, params.get(i));
				}
			}
		}
		return query.list();
	}

	public void deleteBySql(String sql, List<Object> params){
		SQLQuery query = this.getSession().createSQLQuery(sql);
		if (null != params && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				query.setParameter(i, params.get(i));
			}
		}
		query.executeUpdate();
	}
	
	public T findById(Class<T> entityClass,Serializable id) {
		return (T) this.getSession().get(entityClass, id);
	}

	// 分页使用
	public List<T> findByPage(Class<T> entityClass, int start, int limit) {
		Query query = this.getSession().createQuery("select o from " + entityClass.getName() + " o");
		query.setFirstResult(start).setMaxResults(limit);
		return query.list();
	}

	public Integer getTotalCount(String sql) {
		sql = sql.toLowerCase();
		if(sql.indexOf("from") != -1){
			String sqlEnd = sql.substring(sql.indexOf("from"),sql.length());
			Query query = this.getSession().createSQLQuery("select count(1) "+sqlEnd);
			
			List<T> list = query.list();
			if(list!=null&&list.size()>0){
				return Integer.parseInt(list.get(0).toString());
			}
		}
		return 0;
//		return (T) this.getSession().createQuery("select count(o) from " + entityClass.getName() + " o").uniqueResult();
	}

	public Integer getPageCount(String hql, List<Object> params) {
		Query query = this.getSession().createQuery(hql);
		if (null != params && params.size() > 0) {
			for (int i = 0; i < params.size(); i++) {
				query.setParameter(i, params.get(i));
			}
		}
		List<T> list = query.list();
		if(list!=null){
			return list.size();
		}else{
			return 0;
		}
	}
	
	public void updateBySelective(Class<T> entityClass, Map<String, Object> params,String id,String idName) {
		params.remove("serialVersionUID");
		params.remove(idName);
		String hql = "update "+entityClass.getName()+" set ";
		for (String key : params.keySet()) {
		      hql += key +"=? ,";
		}
		hql = hql.substring(0, hql.length()-1);
		hql += " where "+idName+"='"+id+"'";
		System.out.println(hql);
		Query query = this.getSession().createQuery(hql);
		if (null != params && params.size() > 0) {
			int i = 0;
			for (String key : params.keySet()) {
				query.setParameter(i, params.get(key));
				i++;
			}
		}
		query.executeUpdate();
	}

	@Override
	public List<T> findByParam(Class<T> entityClass, String paramName,String operation,
			Object paramValue) {
		String hql = "select t from "+ entityClass.getName() +" t where "+paramName+" "+operation+" :param";
		Query query = this.getSession().createQuery(hql);
		query.setParameter("param", paramValue);
		return query.list();
	}
}
