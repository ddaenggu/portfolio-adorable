package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectWearOrderByPriceDesc {

	static ProcessSelectWearOrderByPriceDesc pswobpd = new ProcessSelectWearOrderByPriceDesc();

	public static ProcessSelectWearOrderByPriceDesc instance() {
		return pswobpd;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectWear() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selallwearorderbypricedesc");
		sqls.close();
		return list;
	}
}
