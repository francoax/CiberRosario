package dto;

import entities.TypePc;

public class ComputersSpecification {

	private String motherboard;
	private String videocard;
	private String ram;
	private String core;
	private String storage;
	private TypePc type;
	private int amount;
	
	public TypePc getType() {
		return type;
	}
	public void setType(TypePc type) {
		this.type = type;
	}
	public String getMotherboard() {
		return motherboard;
	}
	public void setMotherboard(String motherboard) {
		this.motherboard = motherboard;
	}
	public String getVideocard() {
		return videocard;
	}
	public void setVideocard(String videocard) {
		this.videocard = videocard;
	}
	public String getRam() {
		return ram;
	}
	public void setRam(String ram) {
		this.ram = ram;
	}
	public String getCore() {
		return core;
	}
	public void setCore(String core) {
		this.core = core;
	}
	public String getStorage() {
		return storage;
	}
	public void setStorage(String storage) {
		this.storage = storage;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	
	
	
	
	
}
