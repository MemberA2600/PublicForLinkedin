using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Ghost_Things : MonoBehaviour
{

    public SpriteRenderer render;
    public Sprite[] sprites;
    public AudioSource aud;
    public AudioClip[] clips;
    private int spriteIndex;
    GameObject Marisa;
    bool Left;
    int counter;
    // Start is called before the first frame update

    void Awake()
    {
        Marisa = GameObject.Find("Marisa_Player");
        aud = GetComponent<AudioSource>();
        render = GetComponent<SpriteRenderer>();
        spriteIndex = 0;
    }

    void Start()
    {
        StartCoroutine(SpriteAnimator());
        counter = 0;
    }

    IEnumerator SpriteAnimator()
    {
        while (true)
        {
            if (spriteIndex > 2)
            {
                spriteIndex = 0;
            }
            else
            {
                spriteIndex++;
            }
            render.sprite = sprites[spriteIndex];

            if (Random.Range(0, 200 - (Marisa.GetComponent<MySprite>().level * 10)) < 50) StartCoroutine(MoveALot());

            yield return new WaitForSeconds(.1f);
        }
    }

    IEnumerator MoveALot()
    {


        while (Random.Range(0, Marisa.GetComponent<MySprite>().level*3+20)  > 4)
        {

            if (Left == true)
            {
                transform.position -= new Vector3(Time.deltaTime * 10, 0, 0);
            }
            else
            {
                transform.position += new Vector3(Time.deltaTime * 10, 0, 0);
            }

            counter++;
            int temp = 15 - Marisa.GetComponent<MySprite>().level;


            if (counter == temp)
            {
                for (int x = 0; x < 3; x++)
                {
                    GameObject prefab = (GameObject)Resources.Load("Projectile_Ghost");
                    GameObject LastObject = Instantiate(prefab, transform.position, Quaternion.identity);
                    LastObject.GetComponent<GhostShoot>().direction = x;
                    counter = 0;
                }
            }



            yield return new WaitForSeconds(.0005f);

        }

    }




    // Update is called once per frame
    void Update()
    {



        if (Marisa.transform.position.x < transform.position.x)
        {
            Left = true;
        }
        else
        {
            Left = false;
        }
            
        /*
        Vector3 CamPos = Camera.main.ScreenToWorldPoint(new Vector3(0, Screen.height, 0));
        if (transform.position.x < CamPos.x + 25) Left = false;

        CamPos = Camera.main.ScreenToWorldPoint(new Vector3(Screen.width, Screen.height, 0));
        if (transform.position.x > CamPos.x - 25) Left = true;
        */
        Vector3 pos = Camera.main.WorldToScreenPoint(transform.position);


        if (pos.y > 0)
        {
            transform.position -= new Vector3(0f, 0.4f * Time.deltaTime, 0);

        }
        else
        {
            GameObject.Find("SceneController").GetComponent<Spawn>().enemyNumber--;
            Destroy(gameObject);

        }
        
    }


    void OnCollisionEnter2D(Collision2D col)
    {
        if (col.gameObject.tag == "playerShoot")
        {
            Destroy(col.gameObject);
            GameObject.Find("SceneController").GetComponent<Spawn>().enemyNumber--;
            Marisa.GetComponent<MySprite>().exp += 4;
            GameObject prefab = (GameObject)Resources.Load("Explosion");
            Instantiate(prefab, transform.position, Quaternion.identity);
            Destroy(gameObject);
        }
    }
}
