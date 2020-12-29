using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MySprite : MonoBehaviour
{

    public SpriteRenderer render;
    public Sprite[] clips;
    public int spriteIndex;
    public float speed;
    private int coolDown;
    private int coolDown_Star;

    public int level;
    public int exp;
    public AudioSource aud;
    public AudioClip[] audioclips;
    public int Life;
    public GameObject SceneController;
    public bool dead;


    // Start is called before the first frame update
    void Awake()
    {
        Life = 6;
        spriteIndex = 0;
        render = GetComponent<SpriteRenderer>();
        coolDown = 0;
        coolDown_Star = 0;
        level = 0;
        exp = 0;
        aud = GetComponent<AudioSource>();
    }

    void Start()
    {
        StartCoroutine(SpriteAnimator());
    }

    IEnumerator SpriteAnimator()
    {
        while (true)
        {
            if (spriteIndex > 3)
            {
                spriteIndex = 0;
            }
            else
            {
                spriteIndex++;
            }

            render.sprite = clips[spriteIndex];
            yield return new WaitForSeconds(.1f);
        }
    }

    // Update is called once per frame
    void Update()
    {
        if (dead == false)
        {
            if (exp > (level * 30) + 20 && level < 6)
            {
                exp = 0;
                level++;
                aud.clip = audioclips[0];
                aud.Play();
            }


            if (coolDown > 0) coolDown--;
            if (coolDown_Star > 0) coolDown_Star--;

            if (Input.GetKey(KeyCode.Space) && coolDown == 0)
            {
                GameObject prefab = (GameObject)Resources.Load("Projectile_Marisa");
                Instantiate(prefab, transform.position, Quaternion.identity);
                coolDown = 50 - (level * 10);
            }

            if (Input.GetKey(KeyCode.Space) && coolDown_Star == 0)
            {
                GameObject prefab = (GameObject)Resources.Load("Projectile_Marisa_Star");
                Instantiate(prefab, transform.position, Quaternion.identity);
                coolDown_Star = 250 - (level * 35);
            }

            Vector3 pos = Camera.main.WorldToScreenPoint(transform.position);

            if (Input.GetKey(KeyCode.LeftArrow) && pos.x > 20)
            {
                if (speed < 5) speed += .03f;
                if (pos.x > 20)
                {
                    transform.position -= new Vector3(speed * Time.deltaTime, 0, 0);
                }
                else
                {
                    speed = 0;
                }
            }

            if (Input.GetKey(KeyCode.RightArrow) && pos.x < Screen.width - 20)
            {
                if (speed < 5) speed += .03f;
                if (pos.x < Screen.width - 20)
                {
                    transform.position += new Vector3(speed * Time.deltaTime, 0, 0);
                }
                else
                {
                    speed = 0;
                }

            }

            if (Input.GetKey(KeyCode.UpArrow) && pos.y < Screen.height - 40)
            {
                if (speed < 5) speed += .03f;
                if (pos.y < Screen.height - 40)
                {
                    transform.position += new Vector3(0, speed * Time.deltaTime, 0);
                }
                else
                {
                    speed = 0;
                }

            }

            if (Input.GetKey(KeyCode.DownArrow) && pos.y > 0)
            {
                if (speed < 5) speed += .03f;
                if (pos.y > 40)
                {
                    transform.position -= new Vector3(0, speed * Time.deltaTime, 0);
                }
                else
                {
                    speed = 0;
                }

            }


            if (Input.GetKey(KeyCode.LeftArrow) == false && Input.GetKey(KeyCode.RightArrow) == false
                && Input.GetKey(KeyCode.UpArrow) == false && Input.GetKey(KeyCode.DownArrow) == false)
            {
                speed = 0;
            }
        }
        else
        {
            render.enabled = false;

        }

    }

     void OnCollisionEnter2D(Collision2D col)
     {
         if (dead == false)
         {
             if (col.gameObject.tag == "Eneny")
             {
                 SceneController.GetComponent<Spawn>().enemyNumber--;
             }
             if (col.gameObject.tag == "EnemyDouble")
             {
                 SceneController.GetComponent<Spawn>().enemyNumber -= 2;
             }

             if (col.gameObject.tag == "Enemy" ||
                 col.gameObject.tag == "EnemyDouble" ||
                 col.gameObject.tag == "enemyShoot")
             {
                 Life -= 1;
                 GameObject prefab = (GameObject)Resources.Load("Explosion");
                 GameObject LastObject = Instantiate(prefab, col.gameObject.transform.position, Quaternion.identity);
                 Destroy(col.gameObject);
                 if (Life == 0)
                 {
                     prefab = (GameObject)Resources.Load("Explosion");
                     LastObject = Instantiate(prefab, transform.position, Quaternion.identity);
                     aud.clip = audioclips[1];
                     aud.Play();
                     prefab = (GameObject)Resources.Load("GameOver");
                     LastObject = Instantiate(prefab, new Vector3(0,0,0), Quaternion.identity);
                     dead = true;
                 }
             }
         }
     }

}
