using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Change_Color : MonoBehaviour
{

    private SpriteRenderer render;
    private bool GoTrans;
    private float opacity; 

    // Start is called before the first frame update
    void Start()
    {
        render = GetComponent<SpriteRenderer>();
        GoTrans = false;
        opacity = (float)0.7;
        render.color = new Color(1f, 1f, 1f, opacity);
        StartCoroutine(ChangeColor());
        
    }

    // Update is called once per frame
    void Update()
    {

        

    }

    IEnumerator ChangeColor()
    {
        while (true)
        {
            if (GoTrans == true)
            {
                if (opacity > 0)
                {
                    opacity -= (float)0.02;

                    render.color = new Color(1f, 1f, 1f, opacity);
                }
                else
                {
                    GoTrans = false;
                }

            }
            else
            {
                if (opacity < 0.7)
                {
                    opacity += (float)0.01;
                    render.color = new Color(1f, 1f, 1f, opacity);
                }
                else
                {
                    GoTrans = true;
                }
            }

            yield return new WaitForSeconds((float)0.1);
        }
    }

}
