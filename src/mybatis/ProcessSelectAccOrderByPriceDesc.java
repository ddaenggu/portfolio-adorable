package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectAccOrderByPriceDesc {
	
	static ProcessSelectAccOrderByPriceDesc psaobpd = new ProcessSelectAccOrderByPriceDesc();
	public static ProcessSelectAccOrderByPriceDesc instance() {
		return psaobpd;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectAcc() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selaccorderbypricedesc");
		sqls.close();
		return list;
	}

}
