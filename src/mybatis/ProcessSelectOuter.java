package mybatis;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import model.ModelProduct;

public class ProcessSelectOuter {

	static ProcessSelectOuter pso = new ProcessSelectOuter();

	public static ProcessSelectOuter instance() {
		return pso;
	}

	private SqlSessionFactory sqlsession = ConfigMap.getSqlsession();

	public List<ModelProduct> selectOuter() {
		SqlSession sqls = sqlsession.openSession();
		List<ModelProduct> list = sqls.selectList("selouter");
		sqls.close();
		return list;
	}

}
