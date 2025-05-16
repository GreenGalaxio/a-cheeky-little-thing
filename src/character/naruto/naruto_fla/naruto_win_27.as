// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//naruto_fla.naruto_win_27

package naruto_fla
{
    import flash.display.MovieClip;
    import com.mcleodgaming.ssf2api.core.SSF2API;

    public dynamic class naruto_win_27 extends MovieClip 
    {

        public var whichWin:*;
        public var winString:*;

        public function naruto_win_27()
        {
            addFrameScript(0, this.frame1, 8, this.frame9, 28, this.frame29, 33, this.frame34, 38, this.frame39, 43, this.frame44, 52, this.frame53);
        }

        internal function frame1():*
        {
            if (((parent) && (SSF2API.isReady())))
            {
                this.whichWin = 0;
                this.winString = "win";
                if (SSF2API != null)
                {
                    this.whichWin = (Math.floor((SSF2API.random() * 2)) + 1);
                };
                if (this.whichWin > 2)
                {
                    this.whichWin = 2;
                };
                this.winString = (this.winString + this.whichWin);
                this.gotoAndPlay(this.winString);
            };
        }

        internal function frame9():*
        {
            SSF2API.playSound("naruto_win");
        }

        internal function frame29():*
        {
            gotoAndPlay("again");
        }

        internal function frame34():*
        {
            SSF2API.playSound("naruto_seal");
        }

        internal function frame39():*
        {
            SSF2API.playSound("naruto_bushin");
        }

        internal function frame44():*
        {
            SSF2API.playSound("naruto_taunt");
        }

        internal function frame53():*
        {
            this.gotoAndPlay("loop");
        }


    }
}//package naruto_fla

