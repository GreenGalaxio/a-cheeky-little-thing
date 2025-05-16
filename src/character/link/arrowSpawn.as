// Decompiled by AS3 Sorcerer 6.20
// www.as3sorcerer.com

//arrowSpawn

package 
{
    import flash.display.MovieClip;

    public dynamic class arrowSpawn extends MovieClip 
    {

        public function arrowSpawn()
        {
            addFrameScript(8, this.frame9);
        }

        internal function frame9():*
        {
            stop();
            parent.removeChild(this);
        }


    }
}//package 

