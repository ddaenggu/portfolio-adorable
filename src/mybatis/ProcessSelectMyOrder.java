package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectMyOrder {

	static ProcessSelectMyOrder psmo = new ProcessSelectMyOrder();
	public static ProcessSelectMyOrder instance() {
		return psmo;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public List<ModelProduct> selectMyOrder(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selmyorder",mp);
		sqls.close();
		return list;
	}
	
	public List<ModelProduct> selectOrdercode(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> arr = sqls.selectList("selordercode",mp);
		sqls.close();
		return arr;
	}
}
