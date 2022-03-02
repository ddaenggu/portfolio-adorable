package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectOuterOrderByPriceDesc {

	static ProcessSelectOuterOrderByPriceDesc psoobpd = new ProcessSelectOuterOrderByPriceDesc();
	public static ProcessSelectOuterOrderByPriceDesc instance() {
		return psoobpd;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectOuter() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selouterorderbypricedesc");
		sqls.close();
		return list;
	}
}
