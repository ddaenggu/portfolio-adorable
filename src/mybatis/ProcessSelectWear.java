package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectWear {
	
	static ProcessSelectWear psw = new ProcessSelectWear();
	public static ProcessSelectWear instance() {
		return psw;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public List<ModelProduct> selectWear() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selallwear");
		sqls.close();
		return list;
	}

}
