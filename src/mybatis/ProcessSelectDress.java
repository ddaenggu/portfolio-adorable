package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectDress {
	
	static ProcessSelectDress psd = new ProcessSelectDress();
	public static ProcessSelectDress instance() {
		return psd;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectDress() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seldress");
		sqls.close();
		return list;
	}

}
