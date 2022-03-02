package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectRecommendOrderByName {

	static ProcessSelectRecommendOrderByName psrobn = new ProcessSelectRecommendOrderByName();

	public static ProcessSelectRecommendOrderByName instance() {
		return psrobn;
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
		List<ModelProduct> list = sqls.selectList("selrecommendorderbyname", mp);
		sqls.close();
		return list;
	}

	public List<ModelProduct> selectAllRecommend() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selallrecommendorderbyname");
		sqls.close();
		return list;
	}

}
