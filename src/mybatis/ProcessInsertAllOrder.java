package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessInsertAllOrder {

	static ProcessInsertAllOrder piao = new ProcessInsertAllOrder();
	public static ProcessInsertAllOrder instance() {
		return piao;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public int selectMaxOrderNum() {
		SqlSession sqls = sqlsession.openSession();
		int max = 0;
		if (sqls.selectOne("selmaxordernum") == null) {
			max = 0;
		}
		else {
			max = sqls.selectOne("selmaxordernum");
		}
		sqls.close();
		return max+1;
	}
	
	public void insertOrder(ArrayList<ModelProduct> list) {
		SqlSession sqls = sqlsession.openSession();
		for (ModelProduct mp : list) {
			sqls.insert("insallorder",mp);
			sqls.commit();
		}
		sqls.close();
	}
	
	public void updateProduct(ArrayList<ModelProduct> list) {
		SqlSession sqls = sqlsession.openSession();
		for (ModelProduct mp : list) {
			sqls.update("updproquantity",mp);
			sqls.commit();
		}
		sqls.close();
	}
	
	public void updatePoint(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		sqls.update("updpoint",mp);
		sqls.commit();
		sqls.close();
	}
	
	public void deleteCart(ArrayList<ModelProduct> list) {
		SqlSession sqls = sqlsession.openSession();
		for (ModelProduct mp : list) {
			sqls.delete("delcartprocode",mp);
			sqls.commit();
		}
		sqls.close();
	}
}
