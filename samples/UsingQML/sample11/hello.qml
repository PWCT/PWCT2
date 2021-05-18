
	
	import QtQuick 2.0
	import QtDataVisualization 1.2
	
	Item {
	    width: 800
	    height: 600
	
	    Scatter3D {
	        width: parent.width
	        height: parent.height
	        Scatter3DSeries {
	            ItemModelScatterDataProxy {
	                itemModel: dataModel
	                // Mapping model roles to scatter series item coordinates.
	                xPosRole: "xPos"
	                yPosRole: "yPos"
	                zPosRole: "zPos"
	            }
	        }
	    }
	
	    ListModel {
	        id: dataModel
	        ListElement{ xPos: "2.754"; yPos: "1.455"; zPos: "3.362"; }
	        ListElement{ xPos: "3.164"; yPos: "2.022"; zPos: "4.348"; }
	        ListElement{ xPos: "4.564"; yPos: "1.865"; zPos: "1.346"; }
	        ListElement{ xPos: "1.068"; yPos: "1.224"; zPos: "2.983"; }
	        ListElement{ xPos: "2.323"; yPos: "2.502"; zPos: "3.133"; }
	    }
	}
	