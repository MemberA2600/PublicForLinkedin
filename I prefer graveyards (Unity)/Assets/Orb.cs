using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class Orb : MonoBehaviour
{

    public GameObject orb;
    public GameObject[] obelisks;
    public GameObject player;
    GameObject blast;
    public AudioSource aud;
    public AudioClip clip;
    // Start is called before the first frame update
    public int points;
    public GameObject t;

    void placeOrb()
    {
        int r = Random.Range(0, obelisks.Length);
        orb.transform.position = new Vector3(
            obelisks[r].transform.position.x,
            14,
            obelisks[r].transform.position.z);



    }

    void Start()
    {
        aud = GetComponent<AudioSource>();
        points = PlayerPrefs.GetInt("points");
        t.GetComponent<tex>().text.text = points.ToString();
        placeOrb();
    }

    // Update is called once per frame
    void Update()
    {

        PlayerPrefs.SetInt("points", points);
        PlayerPrefs.Save();


        if (Mathf.Abs(player.transform.position.x-transform.position.x)<5 &&
            Mathf.Abs(player.transform.position.z - transform.position.z) < 5){
            GameObject preFab = (GameObject)Resources.Load("Blast");
            aud.clip = clip;
            aud.Play();
            blast = Instantiate(preFab, new Vector3(transform.position.x, transform.position.y, transform.position.z), Quaternion.identity);
            points++;
            t.GetComponent<tex>().text.text=points.ToString();

            placeOrb();
        }

        if (player.GetComponent<MoveYourself>().dead == true) points = 0;
    }
 
}