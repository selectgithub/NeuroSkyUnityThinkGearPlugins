using UnityEngine;
using System.Collections;

public class DisplayData : MonoBehaviour {
	
	public Texture2D[] signalIcons;
	
	private float indexSignalIcons = 1;
	private bool enableAnimation = false;
	private float animationInterval = 0.06f;
	
    ThinkGearController controller;
	
	private int Raw = 0;
	private int PoorSignal = 200;
	private int Attention = 0;
	private int Meditation = 0;
	private int Blink = 0;
	private float Delta = 0.0f;
	private float Theta = 0.0f;
	private float LowAlpha = 0.0f;
	private float HighAlpha = 0.0f;
	private float LowBeta = 0.0f;
	private float HighBeta = 0.0f;
	private float LowGamma = 0.0f;
	private float HighGamma = 0.0f;
	
	// Use this for initialization
	void Start () {
		controller = GameObject.Find("ThinkGear").GetComponent<ThinkGearController>();

		controller.UpdateRawdataEvent += OnUpdateRaw;
		controller.UpdatePoorSignalEvent += OnUpdatePoorSignal;
		controller.UpdateAttentionEvent += OnUpdateAttention;
		controller.UpdateMeditationEvent += OnUpdateMeditation;
		
		controller.UpdateDeltaEvent += OnUpdateDelta;
		controller.UpdateThetaEvent += OnUpdateTheta;

		controller.UpdateHighAlphaEvent += OnUpdateHighAlpha;
		controller.UpdateHighBetaEvent += OnUpdateHighBeta;
		controller.UpdateHighGammaEvent += OnUpdateHighGamma;

		controller.UpdateLowAlphaEvent += OnUpdateLowAlpha;
		controller.UpdateLowBetaEvent += OnUpdateLowBeta;
		controller.UpdateLowGammaEvent += OnUpdateLowGamma;

		controller.UpdateBlinkEvent += OnUpdateBlink;
	
	}
	
	void OnUpdatePoorSignal(int value){
		PoorSignal = value;
		if(value == 0){
      		indexSignalIcons = 0;
			enableAnimation = false;
		}else if(value == 200){
      		indexSignalIcons = 1;
			enableAnimation = false;
		}else if(!enableAnimation){
			indexSignalIcons = 2;
			enableAnimation = true;
		}
	}
	void OnUpdateRaw(int value){
		Raw = value;
	}
	void OnUpdateAttention(int value){
		Attention = value;
	}
	void OnUpdateMeditation(int value){
		Meditation = value;
	}
	void OnUpdateDelta(float value){
		Delta = value;
	}
	void OnUpdateTheta(float value){
		Theta = value;
	}
	void OnUpdateHighAlpha(float value){
		HighAlpha = value;
	}
	void OnUpdateHighBeta(float value){
		HighBeta = value;
	}
	void OnUpdateHighGamma(float value){
		HighGamma = value;
	}
	void OnUpdateLowAlpha(float value){
		LowAlpha = value;
	}
	void OnUpdateLowBeta(float value){
		LowBeta = value;
	}
	void OnUpdateLowGamma(float value){
		LowGamma = value;
	}

	void OnUpdateBlink(int value){
		Blink = value;
	}
	
	// Update is called once per frame
	void Update () {
	
	}
	
	/**
	 *when Fixed Timestep == 0.02 
	 **/
	void FixedUpdate(){
		if(enableAnimation){
			if(indexSignalIcons >= 4.8){
				indexSignalIcons = 2;
			}
			indexSignalIcons += animationInterval;
		}
		
	}
	
	void OnGUI(){
		GUILayout.BeginHorizontal();
		GUILayout.Label("Demo App");
		GUILayout.Space(Screen.width-250);
		GUILayout.Label(signalIcons[(int)indexSignalIcons]);
		GUILayout.EndHorizontal();
		
		if(GUI.Button( new Rect(90,20,100,80),"Init")){
			UnityThinkGear.Init(true);
		}
		
		if(GUI.Button(new Rect(90,140,100,80),"Start")){
			UnityThinkGear.StartStream();
		}
		
		if(GUI.Button(new Rect(90,250,100,80),"Quit")){
			Application.Quit();
		}
		
		GUILayout.BeginVertical();
		GUILayout.Label("Raw:" + Raw);
		GUILayout.Label("PoorSignal:" + PoorSignal);
		GUILayout.Label("Attention:" + Attention);
		GUILayout.Label("Meditation:" + Meditation);
		GUILayout.Label("Blink:" + Blink);
		GUILayout.Label("Delta:" + Delta);
		GUILayout.Label("Theta:" + Theta);
		GUILayout.Label("LowAlpha:" + LowAlpha);
		GUILayout.Label("HighAlpha:" + HighAlpha);
		GUILayout.Label("LowBeta:" + LowBeta);
		GUILayout.Label("HighBeta:" + HighBeta);
		GUILayout.Label("LowGamma:" + LowGamma);
		GUILayout.Label("HighGamma:" + HighGamma);
		
		GUILayout.EndVertical();
	}	
}
