package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectTopOrderByPrice {

	static ProcessSelectTopOrderByPrice pstobp = new ProcessSelectTopOrderByPrice();

	public static ProcessSelectTopOrderByPrice instance() {
		return pstobp;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectTop() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seltoporderbyprice");
		sqls.close();
		return list;
	}

}
