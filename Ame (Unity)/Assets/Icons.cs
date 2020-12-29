using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Icons : MonoBehaviour
{

    public GameObject Marisa;
    public GameObject LifeIcon;
    public GameObject ManaIcon;
    public GameObject HealthBar;
    public GameObject ManaBar;



    // Start is called before the first frame update

    void Awake()
    {

    }

    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        Vector3 Pos = Camera.main.ScreenToWorldPoint(new Vector3(0, Screen.height, 0));
        LifeIcon.transform.position = new Vector3(Pos.x + 1, Pos.y - 1, 0);
        ManaIcon.transform.position = new Vector3(Pos.x + 7, Pos.y - 1, 0);
        HealthBar.transform.position = new Vector3(Pos.x + 3.5f, Pos.y - 1.5f, 0);
        ManaBar.transform.position = new Vector3(Pos.x + 9.5f, Pos.y - 1.5f, 0);
        //ManaBar.GetComponent<SpriteRenderer>().color = new Color(0.25f, 0.25f, 1f, 1f);

        HealthBar.GetComponent<SpriteRenderer>().sprite = ManaBar.GetComponent<Bar>().sprites[
            (int)Marisa.GetComponent<MySprite>().Life
            ];

        /*
        float temp = (float)Marisa.GetComponent<MySprite>().exp / ((Marisa.GetComponent<MySprite>().level * 30) + 20);
        ManaBar.GetComponent<SpriteRenderer>().sprite = ManaBar.GetComponent<Bar>().sprites[
            (int)Mathf.Round(temp*100/(float)16.6)
            ];
        */

       

        ManaBar.GetComponent<SpriteRenderer>().sprite = ManaBar.GetComponent<Bar>().sprites[
                        (int)Marisa.GetComponent<MySprite>().level
            ]; 

    }
}
