package br.com.alvoradamaringa.persistence;

import java.util.List;

import javax.ejb.Stateless;
import javax.persistence.Query;

import br.com.alvoradamaringa.domain.NivelUsuario;
import br.com.alvoradamaringa.domain.Usuario;

@Stateless
public class UsuarioDAOImpl extends GenericDAOImpl<Long, Usuario> implements
		UsuarioDAO {

	private static final String CONSULTA_LOGIN = "SELECT u FROM Usuario u WHERE u.login = :usuario AND u.senha = :senha";

	public Usuario consultar(String usuario, String senha) {
		Query query = entityManager.createQuery(CONSULTA_LOGIN);
		query.setParameter("usuario", usuario);
		query.setParameter("senha", senha);
		try {
			return (Usuario) query.getSingleResult();
		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public List<Usuario> consultarUsuario(String nome, NivelUsuario nivelUsuario) {
		return null;
	}

}
