package test

import java.util.List
import java.util.ArrayList
import org.junit.Before
import org.junit.Test
import org.junit.Assert
import org.jpl7.Atom
import org.jpl7.Query

class HijosTest {

	Query queryHijosFer

	@Before
	def void setUp() throws Exception {
		this.abrir("resource/hijos.pl")
		queryHijosFer = new Query("hijo(fernando, Hijo)")
	}

	@Test
	def void hijosDeFernando() {
		Assert.assertEquals(2, queryHijosFer.allSolutions.size)
	}

	@Test
	def void chiaraEsHijaDeFernandoSabiendoProlog() {
		Assert.assertTrue(new Query("hijo(fernando, chiara)").hasSolution)
	}

	@Test
	def void chiaraEsHijaDeFernandoMenosDeclarativo() {
		val hijos = this.getSolutions(queryHijosFer, "Hijo")
		Assert.assertTrue(hijos.contains(new Atom("chiara")))
	}

	/** *******************************************************************/
	/**                     DEFINICIONES PRIVADAS                        **/
	/** *******************************************************************/ 
	private def void abrir(String archivoFuente) {
		val atomoArchivo = new Atom(archivoFuente)
		val queryConsult = new Query("consult", atomoArchivo)
		queryConsult.oneSolution
	}

	private def List<Atom> getSolutions(Query query, String variable) {
		val results = new ArrayList<Atom>
		while (query.hasMoreSolutions()) {
			val result = query.nextSolution().get(variable) as Atom
			results.add(result)
		}
		return results
	}
}
