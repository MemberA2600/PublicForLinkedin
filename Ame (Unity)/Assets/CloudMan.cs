using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CloudMan : MonoBehaviour
{

    public SpriteRenderer render;
    public Sprite[] sprites;
    private int spriteIndex;
    public GameObject Marisa;
    int counter;

    // Start is called before the first frame update

    void Awake()
    {
        render = GetComponent<SpriteRenderer>();
        Marisa = GameObject.Find("Marisa_Player");
        counter = 20;

    }
    void Start()
    {
        StartCoroutine(Do_Things());
    }


    void setNormalSprite()
    {
        if (spriteIndex > 1)
        {
            spriteIndex = 0;
        }
        else
        {
            spriteIndex++;
        }
        render.sprite = sprites[spriteIndex];
        transform.position += new Vector3(0, Marisa.GetComponent<MySprite>().level * 0.2f * Time.deltaTime, 0);
    }

    IEnumerator Do_Things()
    {
        //Vector3 pos = Camera.main.WorldToScreenPoint(transform.position);
        while (true)
        {
            if (transform.position.y < -3)
            {
                setNormalSprite();
            }
            else
            {
                counter++;
                if (counter > 20 - Marisa.GetComponent<MySprite>().level)
                {
                    GameObject prefab = (GameObject)Resources.Load("Projectile_Cloud");
                    if (Random.Range(0, 101) < 10)
                    {
                        prefab = (GameObject)Resources.Load("Ghost_Shot2");
                    }


                    Vector3 self = transform.position;
                    if (render.flipX == false)
                    {
                        GameObject LastObject = Instantiate(prefab, new Vector3(self.x-0.25f, self.y+1.5f,0), Quaternion.identity);
                    } else
                    {
                        GameObject LastObject = Instantiate(prefab, new Vector3(self.x+0.25f, self.y+1.5f,0), Quaternion.identity);

                    }
                    counter = 0;
                }

                if (counter < 5)
                {
                    render.sprite = sprites[3];
                }
                else
                {
                    setNormalSprite();
                }

            }

            yield return new WaitForSeconds(0.1f);
        }
    }


    // Update is called once per frame
    void Update()
    {
        //Debug.Log(transform.position.x + " " + transform.position.y);
        transform.position += new Vector3(0, Time.deltaTime * .25f, 0);
        Vector3 pos = Camera.main.WorldToScreenPoint(transform.position);
        if (pos.y > Screen.height)
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
            GameObject.Find("SceneController").GetComponent<Spawn>().enemyNumber-=2;
            Marisa.GetComponent<MySprite>().exp += 6;
            GameObject prefab = (GameObject)Resources.Load("Explosion");
            Instantiate(prefab, transform.position, Quaternion.identity);
            Destroy(gameObject);
        }
    }
}
