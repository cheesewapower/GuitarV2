package Action;

import java.util.Iterator;
import java.util.List;

import Entity.Builder;
import Entity.Guitar;
import Entity.GuitarSpec;
import Entity.Type;
import Entity.Wood;
import Util.Inventory;
import net.sf.json.JSONObject;

public class GuitarAction extends BaseAction<Guitar> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public String serialNumber;
	public String price;
	public String model;
	private String builder, type, backWood, topWood;

	public void setModel(String model) {
		this.model = model;
	}

	public String getBuilder() {
		return builder;
	}

	public void setBuilder(String builder) {
		this.builder = builder;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getBackWood() {
		return backWood;
	}

	public void setBackWood(String backWood) {
		this.backWood = backWood;
	}

	public String getTopWood() {
		return topWood;
	}

	public void setTopWood(String topWood) {
		this.topWood = topWood;
	}

	public String All() {
		List<Guitar> guitars = guitarService.queryAll();
		for (Iterator<Guitar> i = guitars.iterator(); i.hasNext();) {
			Guitar guitar = (Guitar) i.next();
			GuitarSpec spec = guitar.getSpec();
			System.out.println("  We have a " + spec.getBuilder() + " " + spec.getModel() + " " + spec.getType()
					+ " guitar:\n     " + spec.getBackWood() + " back and sides,\n     " + spec.getTopWood()
					+ " top.\n  You can have it for only $" + guitar.getPrice() + "!\n  ----");
			JSONObject jsonObject1 = new JSONObject();
			jsonObject1.put("serialNumber", guitar.getSerialNumber());
			jsonObject1.put("builder", spec.getBuilder().toString());
			jsonObject1.put("price", guitar.getPrice());
			jsonObject1.put("model", spec.getModel().toString());
			jsonObject1.put("type", spec.getType().toString());
			jsonObject1.put("backWood", spec.getBackWood().toString());
			jsonObject1.put("topWood", spec.getTopWood().toString());
			jsonArray.add(jsonObject1);
		}
		jsonObject.put("builder", "这是所有的Guitar，请根据需要查询");
		jsonArray.add(jsonObject);
		maps.put("rows", jsonArray);
		return "maps";
	}

	public String queryAllGuitar() {
		Builder builde1r = null;
		Wood backwood1 = null;
		Wood topwood2 = null;
		Type type1 = null;
		try {
			if (builder != null && !builder.equals("")) {

				builde1r = Builder.valueOf(builder.toUpperCase());

			}

			if (backWood != null && !backWood.equals("")) {

				backwood1 = Wood.valueOf(backWood.toUpperCase());

			}

			if (topWood != null && !topWood.equals("")) {
				if (Wood.valueOf(topWood.toUpperCase()) != null) {
					topwood2 = Wood.valueOf(topWood.toUpperCase());
				}

			}

			if (type != null && !type.equals("")) {

				type1 = Type.valueOf(type.toUpperCase());

			}
			Inventory inventory = new Inventory();
			inventory.setGuitars(guitarService.queryAll());
			GuitarSpec whatErinLikes = new GuitarSpec(builde1r, "Stratocastor", type1, 6, backwood1, topwood2);
			@SuppressWarnings("unchecked")
			List<Guitar> matchingGuitars = inventory.search(whatErinLikes);

			if (!matchingGuitars.isEmpty()) {
				System.out.println("Erin, you might like these guitars:");
				for (Iterator<Guitar> i = matchingGuitars.iterator(); i.hasNext();) {
					Guitar guitar = (Guitar) i.next();
					GuitarSpec spec = guitar.getSpec();
					System.out.println("  We have a " + spec.getBuilder() + " " + spec.getModel() + " " + spec.getType()
							+ " guitar:\n     " + spec.getBackWood() + " back and sides,\n     " + spec.getTopWood()
							+ " top.\n  You can have it for only $" + guitar.getPrice() + "!\n  ----");
					JSONObject jsonObject1 = new JSONObject();
					jsonObject1.put("serialNumber", guitar.getSerialNumber());
					jsonObject1.put("builder", spec.getBuilder().toString());
					jsonObject1.put("price", guitar.getPrice());
					jsonObject1.put("model", spec.getModel().toString());
					jsonObject1.put("type", spec.getType().toString());
					jsonObject1.put("backWood", spec.getBackWood().toString());
					jsonObject1.put("topWood", spec.getTopWood().toString());
					jsonArray.add(jsonObject1);
				}
				jsonObject.put("builder", "Erin, you might like these guitars:");
				jsonArray.add(jsonObject);
				maps.put("rows", jsonArray);
			} else {
				jsonObject.put("serialNumber", "sorry ,nothing exsit to meet you,请选择你要查询的Guitar条件");
				jsonArray.add(jsonObject);
				maps.put("rows", jsonArray);
			}
		} catch (Exception e) {
			// TODO: handle exception
			jsonObject.put("serialNumber", "sorry ,nothing exsit to meet you");
			jsonArray.add(jsonObject);
			maps.put("rows", jsonArray);
		}

		return "maps";
	}

}
