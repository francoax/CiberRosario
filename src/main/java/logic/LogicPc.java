package logic;

import data.DataPc;
import entities.Computadora;
import entities.TypePc;

public class LogicPc {

	DataPc pcdao;
	
	public LogicPc() {
		
		pcdao = new DataPc();
	}

	public Computadora getById (int id) {
		
		return pcdao.getById(id);
	}
	public Computadora getOne(TypePc tpc) {
		
		return pcdao.getOne(tpc);
	}
	
	public int getAmountavailable (TypePc tpc) {
		
		return pcdao.countAvailable(tpc);
	}
	
	public Computadora selectToReserve (TypePc tpc) {
		
		return pcdao.findOneavailable(tpc);
	}
	
	public void changeMood(Computadora pc, String estado) {
		
		pcdao.setEstado(pc,estado);
	}
}
