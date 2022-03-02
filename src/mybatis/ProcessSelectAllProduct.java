package mybatis;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectAllProduct {
	
	static ProcessSelectAllProduct psap = new ProcessSelectAllProduct();
	public static ProcessSelectAllProduct instance() {
		return psap;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public ModelProduct selectCustomer(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		ModelProduct m = sqls.selectOne("selcust",mp);
		sqls.close();
		return m;
	}
	
	public List<ModelProduct> selectAllProduct(ArrayList<ModelProduct> list) {
		SqlSession sqls = sqlsession.openSession();
		ArrayList<ModelProduct> arr = new ArrayList<ModelProduct>();
		for (ModelProduct mp : list) {
			 ModelProduct m = sqls.selectOne("selallprod",mp);
			arr.add(m);
		}
		sqls.close();
		return arr;
	}

}
