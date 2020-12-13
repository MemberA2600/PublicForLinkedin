using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class blinking : MonoBehaviour
{

    private bool opacity;
    SpriteRenderer r;

    // Start is called before the first frame update
    void Start()
    {
        opacity = false;
        r = GetComponent<SpriteRenderer>();
        StartCoroutine(Change_Visibility());
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    IEnumerator Change_Visibility()
    {
        while (true)
        {
            opacity = !opacity;
            r.enabled = opacity;

            yield return new WaitForSeconds((float)0.2)
;
        }
    }
}
