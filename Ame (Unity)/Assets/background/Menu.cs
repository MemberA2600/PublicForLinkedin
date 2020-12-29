using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.SceneManagement;


public class Menu : MonoBehaviour
{
    SpriteRenderer render;
    float opacity;
    public bool collided;
    bool started;
    bool blinking;
    bool startFadeOut;

    public GameObject MusicPlayer;
    public GameObject start;
    public GameObject rain;
    public GameObject Marisa;
    public GameObject Logo;

    // Start is called before the first frame update
    void Awake()
    {
        render = GetComponent<SpriteRenderer>();

    }

    void Start()
    {
        blinking = false;
        startFadeOut = false;
        started = false;



        MusicPlayer.GetComponent<Music>().Aud.clip = MusicPlayer.GetComponent<Music>().music[0];
        MusicPlayer.GetComponent<Music>().Aud.Play();
        
         
        
        IEnumerator FadeIn = FadeIN();
        collided = false;

        opacity = (float)0.0;
        StartCoroutine(FadeIn);
        StartCoroutine(MoveTitleDown());
        StartCoroutine(MoveGirlIn());


    }

    // Update is called once per frame
    void Update()
    {
        if (collided == true)
        {
            Vector3 Pos = Camera.main.ScreenToWorldPoint(new Vector3(
                Screen.width-(start.GetComponent<start>().render.sprite.rect.width/2) - 20,
                (start.GetComponent<start>().render.sprite.rect.height/4)*3,
                0
                ));
            start.transform.position = new Vector3(Pos.x, Pos.y, 0);

            if (started == false && Input.GetKey(KeyCode.Space))
            {
                started = true;
                MusicPlayer.GetComponent<Music>().Aud.Stop();
                MusicPlayer.GetComponent<Music>().Aud.loop = false;
                MusicPlayer.GetComponent<Music>().Aud.clip =
                    MusicPlayer.GetComponent<Music>().music[1];
                MusicPlayer.GetComponent<Music>().Aud.Play();
                StartCoroutine(Blinking());
            }

        }

        if (blinking == true && startFadeOut == false)
        {
            startFadeOut = true;
            StartCoroutine(FadeOUT());
        }
    }

    IEnumerator Blinking()
    {
        int x = 0;
        while (x<13){
        
        start.GetComponent<start>().render.enabled = !start.GetComponent<start>().render.enabled;
        x++;
        yield return new WaitForSeconds((float)0.1);
        }
        blinking = true;

    }


    IEnumerator FadeIN()
    {
        while (opacity < (float)1.0)
        {
            opacity += (float)0.02;

            render.color = new Color(1f, 1f, 1f, opacity);
            rain.GetComponent<Rain_Animation>().render.color = new Color(1f, 1f, 1f, opacity);


            yield return new WaitForSeconds((float)0.1);

        }
        

    }

    IEnumerator FadeOUT()
    {
        while (opacity > (float)0.0)
        {
            opacity -= (float)0.02;

            render.color = new Color(1f, 1f, 1f, opacity);
            rain.GetComponent<Rain_Animation>().render.color = new Color(1f, 1f, 1f, opacity);
            Marisa.GetComponent<yyy>().render.color = new Color(1f, 1f, 1f, opacity);
            Logo.GetComponent<xxx>().render.color = new Color(1f, 1f, 1f, opacity);


            yield return new WaitForSeconds((float)0.02);

        }
        SceneManager.LoadScene("Game");


    }

    IEnumerator MoveTitleDown()
    {
        while (GameObject.Find("Logo").transform.position.y > 1.5)
        {
                    

            Logo.transform.position -= new Vector3(0, (float)0.03, 0);

            yield return new WaitForSeconds((float)0.02);
        }
        

    }

    IEnumerator MoveGirlIn()
    {
        while (collided == false)
        {

            Marisa.transform.position += new Vector3((float)0.035, 0, 0);

            yield return new WaitForSeconds((float)0.02);
        }


    }

}
