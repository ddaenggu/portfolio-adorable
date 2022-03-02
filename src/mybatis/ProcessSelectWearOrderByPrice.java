package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectWearOrderByPrice {

	static ProcessSelectWearOrderByPrice pswobp = new ProcessSelectWearOrderByPrice();

	public static ProcessSelectWearOrderByPrice instance() {
		return pswobp;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectWear() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selallwearorderbyprice");
		sqls.close();
		return list;
	}

}
