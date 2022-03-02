package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectTopOrderByPriceDesc {
	
	static ProcessSelectTopOrderByPriceDesc pstobpd = new ProcessSelectTopOrderByPriceDesc();
	public static ProcessSelectTopOrderByPriceDesc instance() {
		return pstobpd;
	}
	
private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();
	
	public List<ModelProduct> selectTop() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("seltoporderbypricedesc");
		sqls.close();
		return list;
	}

}
