using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Music_InGame : MonoBehaviour
{

    public AudioClip[] clips;
    public AudioSource Aud;
    public GameObject[] Faders;
    private float opacity;
    bool fadeIN;

    // Start is called before the first frame update

    void Awake()
    {
        opacity = 0;
        fadeIN = true;
        Aud = GetComponent<AudioSource>();

    }

    void Start()
    {
        Aud.clip = clips[0];
        Aud.loop = true;
        Aud.Play();
       
        foreach (GameObject G in Faders)
        {
            Opacity_Thing();
        }
        StartCoroutine(FadeIn());

    }

    // Update is called once per frame
    void Update()
    {
        if (GameObject.Find("Marisa_Player").GetComponent<MySprite>().dead == true)
        {
            Aud.Stop();
        }
    }


    void Opacity_Thing()
    {
        try
        {
            foreach (GameObject G in Faders)
            {
                G.GetComponent<SpriteRenderer>().color = new Color(1, 1, 1, opacity);
            }
        }
        catch
        {
            //
        }
    }

    IEnumerator FadeIn()
    {
        while (fadeIN == true && opacity < 1.0)
        {
            opacity += 0.02f;
            Opacity_Thing();
            yield return new WaitForSeconds(0.02f);
        }
    }

    IEnumerator FadeOut()
    {
        while (fadeIN == false && opacity > 0.0)
        {
            opacity -= 0.02f;
            Opacity_Thing();
            yield return new WaitForSeconds(0.05f);
        }
    }
}
