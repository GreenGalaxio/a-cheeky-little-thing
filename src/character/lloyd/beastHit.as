// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//beastHit

package 
{
    import flash.display.MovieClip;

    public dynamic class beastHit extends MovieClip 
    {

        public function beastHit()
        {
            addFrameScript(11, this.frame12);
        }

        internal function frame12():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

