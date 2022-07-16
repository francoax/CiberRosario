package logic;

import java.util.LinkedList;

import data.PcDao;
import entities.Computadora;
import entities.TypePc;

public class Pclogic {

	PcDao pcdao;
	
	public Pclogic() {
		
		pcdao = new PcDao();
	}

	public LinkedList<Computadora> getByTypeavailable(TypePc tpc){
		
		return pcdao.findAllavailable(tpc);
	}
	
	public int getAmountavailable (TypePc tpc) {
		
		return pcdao.countAvailable(tpc);
	}
	
}
