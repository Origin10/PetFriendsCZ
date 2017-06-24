package petfriends.listener;

import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionBindingEvent;
@WebListener
public class Mem implements HttpSessionAttributeListener {
	private String attributeName;
	private int attributeValue;
	@Override
	public void attributeAdded(HttpSessionBindingEvent event) {
		 String  attributeName= event.getName();
		 Object  attributeValue = event.getValue();
		System.out.println("   attributeName:  " + attributeName + "   attributeValue:  " + attributeValue);
	}

	@Override
	public void attributeRemoved(HttpSessionBindingEvent event) {
		 String  attributeName= event.getName();
		 Object  attributeValue = event.getValue();
		System.out.println("   ReMoveattributeName:  " + attributeName + "   ReMoveattributeValue:  " + attributeValue);
		
	}

	@Override
	public void attributeReplaced(HttpSessionBindingEvent event) {
		// TODO Auto-generated method stub
		
	}

}
