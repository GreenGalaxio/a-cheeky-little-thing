// Decompiled by AS3 Sorcerer 6.30
// www.as3sorcerer.com

//donkeykong_fla.dkpile_13

package donkeykong_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class dkpile_13 extends MovieClip 
    {

        public function dkpile_13()
        {
            addFrameScript(0, this.frame1, 10, this.frame11, 50, this.frame51);
        }

        internal function frame1():*
        {
        }

        internal function frame11():*
        {
            SSF2API.playSound("dkjump1");
        }

        internal function frame51():*
        {
            gotoAndPlay("win1again");
        }


    }
}//package donkeykong_fla

