package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectRecommendOrderByPriceDesc {

	static ProcessSelectRecommendOrderByPriceDesc psrobpd = new ProcessSelectRecommendOrderByPriceDesc();
	public static ProcessSelectRecommendOrderByPriceDesc instance() {
		return psrobpd;
	}
	
	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public String selectPetskind(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		String petskind = sqls.selectOne("selpetskind", mp);
		sqls.close();
		return petskind;
	}

	public List<ModelProduct> selectRecommend(ModelProduct mp) {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selrecommendorderbypricedesc", mp);
		sqls.close();
		return list;
	}

	public List<ModelProduct> selectAllRecommend() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selallrecommendorderbypricedesc");
		sqls.close();
		return list;
	}
}
