package mybatis;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectOneProduct {

	static ProcessSelectOneProduct psop = new ProcessSelectOneProduct();
	public static ProcessSelectOneProduct instance() {
		return psop;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public ModelProduct selectOneProduct(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		ModelProduct m = sqls.selectOne("seloneprod",mp);
		sqls.close();
		return m;
	}
}
