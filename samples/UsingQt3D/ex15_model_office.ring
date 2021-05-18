load "guilib.ring"

new qApp {

	oView = new Qt3dwindow() 

	oWidget = new QWidget()	
	oContainer = oWidget.createWindowContainer(oView,oWidget,0)

	oRootEntity = new QEntity(oContainer) 

	oInput = new QInputAspect(oRootEntity)
        oView.registerAspect(oInput)

	oCameraEntity = oView.Camera()

	oCameraEntity.lens().setPerspectiveProjection(45.0, 16.0/9.0, 0.1, 1000.0)
    	oCameraEntity.setPosition(new QVector3D(0, 0, 20.0))
    	oCameraEntity.setUpVector(new QVector3D(0, 1, 0))
    	oCameraEntity.setViewCenter(new QVector3D(0, 0, 0))	

	oLightEntity = new QEntity(oRootEntity)
        oLight = new QPointLight(oLightEntity)
	oLight.setColor(new QColor() { setRGB(255,255,255,255) })
	oLight.setIntensity(1)
	oLightEntity.addComponent(oLight)

	oLightTransform = new QTransform(oLightEntity)
	oLightTransform.setTranslation(oCameraEntity.position())
	oLightEntity.addComponent(oLightTransform)

 	oCamController = new  QFirstPersonCameraController(oRootEntity)
    	oCamController.setCamera(oCameraEntity)

	oModel = new qmesh(oRootEntity)

	oModel.setsource(new qURL("file:///"+currentdir()+"/assets/model/Reception_Table.obj") ) 

	oModelTransform = new  QTransform(oModel)
	oModelTransform.setScale(1)
	oModelTransform.setTranslation(new QVector3D(0, -2.5, 16))

	oModelMaterial = new QPhongMaterial(oModel)
	oModelMaterial.setDiffuse(new QColor() {setRGB(0,255,128,255)})

	oModelEntity = new QEntity(oRootEntity)
	oModelEntity.addComponent(oModel)
	oModelEntity.addComponent(oModelmaterial)
	oModelEntity.addComponent(oModelTransform)

	oView.setRootEntity(oRootEntity)

	oLayout = new QVBoxLayout()
	oLayout.AddWidget(oContainer)

	oWidget { 
		setwindowtitle("Using Qt3D - Model (Obj File) - Office") 
		resize(800,600)
		setLayout(oLayout) 
		showMaximized() 
	}

	exec()
}

	 
