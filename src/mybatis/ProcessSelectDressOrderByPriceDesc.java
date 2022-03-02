package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectDressOrderByPriceDesc {
	
	static ProcessSelectDressOrderByPriceDesc psdobpd = new ProcessSelectDressOrderByPriceDesc();
	public static ProcessSelectDressOrderByPriceDesc instance() {
		return psdobpd;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectDress() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seldressorderbypricedesc");
		sqls.close();
		return list;
	}

}
