// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//tails_fla.tailswin_11

package tails_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class tailswin_11 extends MovieClip 
    {

        public function tailswin_11()
        {
            addFrameScript(0, this.frame1, 1, this.frame2, 61, this.frame62, 75, this.frame76, 83, this.frame84);
        }

        internal function frame1():*
        {
        }

        internal function frame2():*
        {
            SSF2API.playSound("tails_win");
        }

        internal function frame62():*
        {
            gotoAndPlay("again");
        }

        internal function frame76():*
        {
            SSF2API.playSound("new_Tails_win2");
        }

        internal function frame84():*
        {
            stop();
        }


    }
}//package tails_fla

